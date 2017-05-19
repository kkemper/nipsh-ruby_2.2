module ApplicationHelper
	#Returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "NIPSH Data Repository"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

  def setup_search_form(builder)
    fields = builder.grouping_fields builder.object.new_grouping,
      object_name: 'new_object_name', child_index: 'new_grouping' do |f|
      render('grouping_fields', f: f)
    end
    content_for :document_ready, %Q{
      var search = new Search({grouping: "#{escape_javascript(fields)}"});
      $(document).on("click", "button.add_fields", function() {
        search.add_fields(this, $(this).data('fieldType'), $(this).data('content'));
        return false;
      });
      $(document).on("click", "button.remove_fields", function() {
        search.remove_fields(this);
        return false;
      });
      $(document).on("click", "button.nest_fields", function() {
        search.nest_fields(this, $(this).data('fieldType'));
        return false;
      });
    }.html_safe
  end

  def button_to_remove_fields
    tag.button 'Remove', class: 'remove_fields btn'
  end

  def button_to_add_fields(f, type)
    new_object, name = f.object.send("build_#{type}"), "#{type}_fields"
    fields = f.send(name, new_object, child_index: "new_#{type}") do |builder|
      render(name, f: builder)
    end

    tag.button button_label[type], class: 'add_fields btn', 'data-field-type': type,
      'data-content': "#{fields}"
  end

  def button_to_nest_fields(type)
    tag.button button_label[type], class: 'nest_fields btn', 'data-field-type': type
  end

  def button_label
    { value:     'Add Value',
      condition: 'Add Condition',
      sort:      'Add Sort',
      grouping:  'Add Condition Group' }.freeze
  end
end

  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end