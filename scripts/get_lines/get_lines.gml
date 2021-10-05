function get_lines(interactive){ if instance_exists(interactive) with interactive {

if	(not variable_instance_exists(interactive, "lines") and not variable_instance_exists(interactive, "lines_repeat")) or
	(is_array(lines) and array_length(lines) == 0)
{
	return undefined
}

var total_lines = is_string(lines) ? (lines != "") : array_length(lines)

if lines == "" or line_index >= array_length(lines)
{
	if	not variable_instance_exists(interactive, "repeat_lines") or 
		array_length(repeat_lines) == 0
	{
		return undefined
	}
	
	if is_array(repeat_lines) return repeat_lines[@ (line_index++ - (total_lines)) mod array_length(repeat_lines)]
	else return [repeat_lines]
}
else
{
	return is_string(lines) ? [lines] : lines[line_index++]
}
}}