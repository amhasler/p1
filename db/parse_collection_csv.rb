require 'net/http'
require "#{Rails.root.join('db')}/utility"

module ParseCollectionCSV
  def self.parse_collection(author, resources, dir)
    collection_file = File.open(File.join(dir, 'collection.csv'))

    # Move to beginning of the data
    move_to("INFORMATION", collection_file)

    # Get the collection information
    information = move_to("WORK", collection_file)
    collection = Collection.new(user:author)
    number_works = 0
    CSV.parse(information, headers: true, converters: :all) do |row|
      # Collection title
      collection.title = row["title"]
      # Number of works
      number_works = row["number_works"]
    end

    # Save the collection
    collection.save!

    # Works
    number_works.times do |i|
      # Chapter
      work_information = move_to("MEDIA", collection_file)
      work = Work.create(collection: collection, user: author)

      CSV.parse(work_information, headers: true, converters: :all) do |row|
        work.title = row["title"]
        work.place = row["place"]
        work.latitude = row["latitude"]
        work.longitude = row["longitude"]
        work.min_year = row["min_date"]
        work.max_year = row["max_date"]
        work.circa = row["circa"]
      end

      work_media = move_to("RESOURCES", collection_file)

      CSV.parse(work_media, headers: true, converters: :all) do |row|

        # Write parse for media here when adding media

      end

      if i == number_works - 1
        # Move to the end of file if we've reached the end of the collection
        work_resources = move_to("EOF", collection_file)
      else
        work_resources = move_to("WORK", collection_file)
      end

      CSV.parse(work_resources, headers: true, converters: :all) do |row|

        # Parse resources when added

      end
      # Save the work
      work.save!
    end
    
    return collection
  end

  def self.parse_resources(dir)
    resources = {}
    CSV.foreach(File.join(dir, 'resources.csv'), headers: true, converters: :all) do |row|
      id = row["id"]
      resources[id] = {
        type: row["type"],
        title: row["title"],
        url: row["resource"]
      }
    end
    resources
  end

  # Moves the file until it finds the string 's', and returns what it finds in between 
  def self.move_to(s, file)
    buf = ""
    while (line = file.gets) do
      begin
        line_csv = CSV.parse(line)[0]
      rescue CSV::MalformedCSVError
        pp "Malformed CSV line. Aborting..."
        pp line
        exit
      end
      break if line_csv[0] == s
      buf += line
    end
    return buf
  end


  def self.save_image_on_item(item, image_id, timeline_resources, dir)
    image_url = timeline_resources[image_id][:url]
    image_title = timeline_resources[image_id][:title]
    image = Utility::save_and_get_remote_resource(image_url, image_title, dir)
    item.image = image
    item.image_caption = image_title
  end

end
