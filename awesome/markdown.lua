spandef = '</span>'

function span_container(bg)
  return '<span background="' ..  bg .. '" font="Liberation Sans 9"> '
end

function span_arrow(bg, color)
  return '<span font="Terminus 8" color="' .. color .. '" background="' .. bg .. '"> ' .. theme.arrow .. "</span>"
end

function span(color, bg)
  if bg then
    return '<span color="' .. color .. '" font="Liberation Sans 8" background="' .. bg .. '"> '
  else
    return '<span color="' .. color .. '" font="Liberation Sans 8"> '
  end
end
