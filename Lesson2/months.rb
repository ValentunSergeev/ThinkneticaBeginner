months = { 31 => ["January", " March", "May", "July", "August", "October", "December"],
           30 => ["April", "June", "September", " November"],
           28 => ["February"] }

months[30].each { |e| print e + " " }
