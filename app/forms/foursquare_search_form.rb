class FoursquareSearchForm
  include ActiveModel::Model

  CLIENT_ID = 'ZSIMAWIKGNGPDD0J4EQCFBVGDSIC2DSVOCCFAXGFWHB3N1VE'
  CLIENT_SECRET = 'FTPVY1GFMG2QSMP2WB32SSAQNXXMGDETFGOBFS1FSBHR0NM5'

  attr_accessor :lat, :lng, :near, :query, :venue_id

  def search_venues
    client.search_venues(search_venues_params)
  end

  private

  def client
    @client ||= Foursquare2::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET)
  end

  def search_venues_params
    p = { v: Time.now.strftime('%Y%m%d'), m: 'foursquare' }
    p[:near] = near
    if lat.present? && lng.present?
      p[:ll] = "#{lat.strip},#{lng.strip}"
    elsif query.present?
      p[:query] = query
    end
    p[:venue_id] = venue_id if venue_id.present?
    p
  end
end
