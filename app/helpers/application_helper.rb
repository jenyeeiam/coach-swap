module ApplicationHelper
  def unique_fields(model, field)
    [nil].concat(model.distinct(field).order(field).pluck(field).compact)
  end

  def link_to_add_fields(name, f, coach)
    new_object = f.object.send(association).new
    id = new_object.object_id
    render new_object
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
