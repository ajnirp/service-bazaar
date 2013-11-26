module ApplicationHelper
  include SessionsHelper
  def all_categories
    Category.all
  end

  def all_category_names
    all_categories.map { |c| c.title }
  end

  def all_category_descriptions
    all_categories.map { |c| c.description }
  end
end

# Monkeypatching

class Time
  # converts 2000-01-01 10:55:00 UTC => 10:55:00 UTC
  # return is of class String
  def remove_year
    to_s.split[1,2].join(' ')
  end
end

class Float
  def round_point5
    (self*2).round / 2.0
  end
end

ActiveSupport::Inflector.inflections do |inflection|
  inflection.irregular "has", "have"
end