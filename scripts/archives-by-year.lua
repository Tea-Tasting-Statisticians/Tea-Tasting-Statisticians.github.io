local function has_class(classes, expected)
  for _, class in ipairs(classes) do
    if class == expected then
      return true
    end
  end

  return false
end

local function slugify_post_name(value)
  while value:match("%.md$") do
    value = value:gsub("%.md$", "")
  end

  value = value:gsub("&", "and")
  value = value:gsub(" ", "-")
  return value
end

local function read_file(path)
  local file = io.open(path, "r")

  if not file then
    return nil
  end

  local content = file:read("*a")
  file:close()
  return content
end

local function extract_front_matter_value(content, key)
  local in_front_matter = false

  for line in (content .. "\n"):gmatch("(.-)\n") do
    if line:match("^%-%-%-%s*$") then
      if not in_front_matter then
        in_front_matter = true
      else
        break
      end
    elseif in_front_matter then
      local value = line:match("^" .. key .. ":%s*(.-)%s*$")

      if value then
        value = value:gsub('^"', ""):gsub('"$', "")
        value = value:gsub("^'", ""):gsub("'$", "")
        return value
      end
    end
  end

  return nil
end

local function collect_posts()
  local posts = {}

  for _, name in ipairs(pandoc.system.list_directory("_posts")) do
    if name:match("%.md$") then
      local path = "_posts/" .. name
      local content = read_file(path)

      if content then
        local title = extract_front_matter_value(content, "title")
        local date = extract_front_matter_value(content, "date")

        if not title or title == "" or not date or date == "" then
          error("Missing title or date in " .. path)
        end

        local slug = name:gsub("^%d%d%d%d%-%d%d%-%d%d%-", "")
        slug = slugify_post_name(slug)

        table.insert(posts, {
          date = date,
          slug = slug,
          title = title
        })
      end
    end
  end

  table.sort(posts, function(left, right)
    if left.date == right.date then
      if left.slug == right.slug then
        return left.title > right.title
      end

      return left.slug > right.slug
    end

    return left.date > right.date
  end)

  return posts
end

local function escape_link_text(value)
  value = value:gsub("%[", "\\[")
  value = value:gsub("%]", "\\]")
  return value
end

local function render_archive_blocks()
  local posts = collect_posts()

  if #posts == 0 then
    return pandoc.read("_No posts yet._", "markdown").blocks
  end

  local lines = {}
  local current_year = nil

  for _, post in ipairs(posts) do
    local year = post.date:sub(1, 4)

    if year ~= current_year then
      if current_year ~= nil then
        table.insert(lines, "")
      end

      table.insert(lines, "## " .. year)
      current_year = year
    end

    table.insert(
      lines,
      string.format(
        "- [%s](/posts/%s/) (%s)",
        escape_link_text(post.title),
        post.slug,
        post.date
      )
    )
  end

  return pandoc.read(table.concat(lines, "\n"), "markdown").blocks
end

function Div(div)
  if has_class(div.classes, "archives-by-year") then
    return render_archive_blocks()
  end
end
