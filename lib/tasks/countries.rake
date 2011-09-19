namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    make_countries
  end
end

def make_countries
  countries = ['Afghanistan', 'Aland Islands', 'Albania', 'Algeria', 'American Samoa', 'Andorra', 'Angola', 'Anguilla', 'Antarctica', 'Antigua and Barbuda', 'Argentina', 'Armenia', 'Aruba', 'Australia', 'Austria']
  codes = ['AF', 'AX', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT']

  countries.each do |country|
    codes.each do |code|
      CountryList.create!(:name => country, :code => code)
    end
  end
end

