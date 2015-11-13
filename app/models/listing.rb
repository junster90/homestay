class Listing < ActiveRecord::Base

	filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_hometype
    ]
  )

	validates :name, :summary, :hometype, :roomtype, :max_guest, :line1, :city, :state, :country, :bedroom, :bed_count, :bathroom, :price, :user_id, presence: true

	belongs_to :user
  has_many :listing_pictures

	scope :with_hometype, lambda { |hometype| where(hometype: [*hometype]) }
	scope :with_roomtype, lambda { |roomtype| where(roomtype: [*roomtype]) }
	scope :with_max_guest, lambda { |max_guest| where(max_guest: [*max_guest]) }

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 3
    where(
      terms.map {
        or_clauses = [
          "LOWER(listings.city) LIKE ?",
          "LOWER(listings.state) LIKE ?",
          "LOWER(listings.country) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

 



end
