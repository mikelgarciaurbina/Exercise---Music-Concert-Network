module ConcertsHelper
	def today(concerts)
		concerts.where("date > ? AND date < ?", Time.now.midnight, Time.now.midnight + 1.day)
	end

	def lastMonth(concerts)
		concerts.where("date > ?", Time.now.midnight + 1.day)
	end
end
