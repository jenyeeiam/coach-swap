module ApplicationHelper
  def unique_fields(model, field)
    [nil].concat(model.distinct(field).order(field).pluck(field).compact)
  end
end
