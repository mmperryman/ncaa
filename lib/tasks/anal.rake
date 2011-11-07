namespace :anal do

  desc "Find the winning teams"
  task :ysis => :environment do
    Team.all.each do |t|
      r = t.records.sort_by(&:period_id)
      a = r[0].wins
      b = r[1].wins
      puts (b-a).to_s + " " + t.name + ": Wins: " + b.to_s + " - " + a.to_s + " = " + (b-a).to_s
    end
  end    
end    