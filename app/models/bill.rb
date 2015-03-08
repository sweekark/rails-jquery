class Bill < ActiveRecord::Base
  filterrific(
     # default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
          :sorted_by,
          :search_query,
          :with_country_id,
          :with_created_at_gte
      ]
  )

  self.per_page = 6
  scope :search_query, lambda { |query|
    # Filters students whose name or email matches the query
    return nil  if query.blank?

    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 2
    where(
        terms.map { |term|
          "(LOWER(bills.name) LIKE ? OR LOWER(bills.name) LIKE ?)"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conds }.flatten
    )

  }
  scope :sorted_by, lambda { |sort_option|
    # Sorts students by sort_key
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    order("bills.created_at #{ direction }")
  }
  scope :with_country_id, lambda { |country_ids|
    # Filters students with any of the given country_ids
  }
  scope :with_created_at_gte, lambda { |ref_date|
  }

  def self.options_for_sorted_by
    [
        ['Registration date (newest first)', 'created_at_desc'],
        ['Registration date (oldest first)', 'created_at_asc'],
    ]
  end


end
