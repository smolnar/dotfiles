spandef = '</span>'

function span_container(bg)
  return '<span background="' ..  bg .. '" font="Liberation Sans 10"> '
end

function span_arrow(bg, color)
  return '<span font="Dejavu Mono for Powerline 10" color="' .. color .. '" background="' .. bg .. '"> ' .. theme.arrow .. "</span>"
end

function span(color, bg)
  if bg then
    return '<span color="' .. color .. '" font="Liberation Sans 10" background="' .. bg .. '"> '
  else
    return '<span color="' .. color .. '" font="Liberation Sans 10"> '
  end
end
