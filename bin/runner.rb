Dir['./lib/*.rb'].each{|file| require file }
processor = FootTraficAnalyser.new('./sample/test.txt')
processor.feed_data #read the sample file and feed data
processor.analysed_data #print output