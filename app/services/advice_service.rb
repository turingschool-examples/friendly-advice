
class AdviceService
def advice_info
  get_advice('/advice')
end

private
  def conn
    Faraday.new(url: 'https://api.adviceslip.com')
  end

  def get_advice(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end
end
