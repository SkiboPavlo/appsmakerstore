require 'rails_helper'

describe ExchangeRate do

  describe '#save_data' do
    it 'respond with status 200' do
      response = Net::HTTP.get(URI.parse('https://sdw.ecb.europa.eu/quickviewexport.do;jsessionid=0474AA98E504663B03D18B0BA109A996?SERIES_KEY=120.EXR.D.USD.EUR.SP00.A&type=csv'))
      expect(response).to be_an_instance_of(String)
      expect(response.size).to be > 0
    end
  end

  describe '#calculate' do
    it 'calculated rate correctly' do
      ExchangeRate.create({unit: 100, period: '2016-10-18'})
      expect(ExchangeRate.calculate(count: 10, date: '2016-10-18')).to eq(1000)
    end

    it 'returns 0 if record not found'do
      expect(ExchangeRate.calculate(count: 10, date: '2016-10-18')).to eq(0)
    end
  end
end
