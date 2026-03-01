# frozen_string_literal: true
#
# Convert Obsidian image embeds into standard Markdown image links at build time.
# Example:
#   ![[스크린샷 2026-02-22 오후 10.28.16.png]]
# -> ![](/img/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202026-02-22%20%EC%98%A4%ED%9B%84%2010.28.16.png)
#
# This lets `bundle exec jekyll serve` render Obsidian embeds without
# requiring file edits before preview/publish.

require "cgi"
require "uri"

module ObsidianImageCompat
  IMAGE_EXT_REGEX = /\.(png|jpe?g|gif|webp|svg|bmp|tiff?|avif)\z/i
  EMBED_REGEX = /!\[\[([^\]|]+?)(?:\|([^\]]+))?\]\]/

  module_function

  def decode_segment(segment)
    URI.decode_www_form_component(segment)
  rescue StandardError
    segment
  end

  def encode_segment(segment)
    CGI.escape(segment).gsub("+", "%20")
  end

  def normalize_image_path(raw_path)
    path = raw_path.to_s.strip
    return nil if path.empty?
    return nil unless path.match?(IMAGE_EXT_REGEX)

    normalized =
      if path.start_with?("/img/")
        path
      elsif path.start_with?("img/")
        "/#{path}"
      elsif path.start_with?("./img/")
        "/#{path.sub(%r{\A\./}, "")}"
      elsif path.start_with?("../img/")
        "/#{path.sub(%r{\A\.\./}, "")}"
      elsif path.start_with?("/")
        path
      else
        "/img/#{path}"
      end

    # Encode each segment safely while keeping slash separators.
    parts = normalized.split("/")
    encoded_parts = parts.map.with_index do |part, idx|
      idx.zero? ? part : encode_segment(decode_segment(part))
    end
    encoded_parts.join("/")
  end

  def local_image_exists?(normalized_path, site_source)
    return false if site_source.nil? || site_source.empty?
    return false unless normalized_path.start_with?("/")

    rel = normalized_path.sub(%r{\A/}, "")
    decoded_rel = rel.split("/").map { |seg| decode_segment(seg) }.join("/")
    abs = File.join(site_source, decoded_rel)
    File.exist?(abs)
  end

  def convert_embeds(content, site_source = nil)
    return content if content.nil? || content.empty?

    content.gsub(EMBED_REGEX) do
      raw_src = Regexp.last_match(1)
      alt = (Regexp.last_match(2) || "").strip
      normalized = normalize_image_path(raw_src)

      if normalized && local_image_exists?(normalized, site_source)
        "![#{alt}](#{normalized})"
      else
        Regexp.last_match(0)
      end
    end
  end
end

Jekyll::Hooks.register [:posts, :pages, :documents], :pre_render do |doc|
  next unless doc.respond_to?(:content)

  site_source = doc.site&.source
  doc.content = ObsidianImageCompat.convert_embeds(doc.content, site_source)
end
