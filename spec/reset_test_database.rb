require 'pg'

def reset_test_database
  connect = PG.connect(dbname: 'makersbnb_test')
  connect.exec('TRUNCATE properties')
end
