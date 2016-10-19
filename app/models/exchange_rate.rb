class ExchangeRate < ApplicationRecord

  def self.save_data
    url =  "https://sdw.ecb.europa.eu/quickviewexport.do;jsessionid=0474AA98E504663B03D18B0BA109A996?SERIES_KEY=120.EXR.D.USD.EUR.SP00.A&type=csv"
    download = open(url)
    IO.copy_stream(download, 'data.csv')
    CSV.new(download).each do |line|
      if line.last.to_f > 0
        @exchange_rate = ExchangeRate.new({unit: line.last, period: line.first})
        @exchange_rate.save
        break
      end
    end
  end
end
