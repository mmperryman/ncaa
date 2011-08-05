require "csv"

namespace :import do

  desc "Import Teams into DB from a CSV File."
  task :teams => :environment do
    puts "Clearing Old Periods..."
    Period.destroy_all
    Period.create(:year => '2010')
    Period.create(:year => '2011')    
    puts "Clearing Old Teams..."
    Team.destroy_all
    Pick.destroy_all
    puts "Reading from teams.csv..."
    CSV.foreach('teams.csv') do |row|
      puts "ROW: #{row.to_s}"
      begin
        school_name = row[0].lstrip
        short_name = row[1].lstrip
        mascot = row[2].lstrip
        wins = row[3].lstrip.to_i
        espn_url = row[4].lstrip
        logo_url = row[5].lstrip
        new_team = Team.create(:name => school_name, 
                               :short_name => short_name, 
                               :mascot => mascot, 
                               :espn_url => espn_url, 
                               :logo_url => logo_url)        
        new_team.records.create(:period_id => Period.find_or_create_by_year('2010').id, :wins => wins)
        new_team.records.create(:period_id => Period.find_or_create_by_year('2011').id, :wins => 0)        
      rescue 
        puts "Unable to import team."
      end  
    end
    puts "Creating Initial User (ME)..."
    User.destroy_all
    u = User.new(:team_name => "Perryman's Moosemen", :email => 'mmperryman@gmail.com', :password => '1234', :password_confirmation => '1234', :first => 'Matt', :last => 'Perryman')
    u.save!
    u.payments.create(:period_id => Period.find_by_year('2011').id, :paid => true)
  end
end
