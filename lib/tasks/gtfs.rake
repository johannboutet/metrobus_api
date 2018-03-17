require 'csv'

namespace :gtfs do
  desc "Import GTFS data in DB"
  task import: :environment do
    [StopTime, Stop, Trip, Route].each(&:delete_all)

    files = {
      routes: Rails.root.join('gtfs', 'routes.txt'),
      trips: Rails.root.join('gtfs', 'trips.txt'),
      stops: Rails.root.join('gtfs', 'stops.txt'),
      stop_times: Rails.root.join('gtfs', 'stop_times.txt')
    }

    if files.values.all? { |name| File.file?(name) }
      files.each do |name, path|
        line_count = `wc -l "#{path}"`.strip.split(' ')[0].to_i - 1
        progress = ProgressBar.create(title: name.to_s.humanize, total: line_count, format: "%t (%c/%C): |%w%i|")
        model = name.to_s.classify.constantize
        attributes = model.attribute_names - %w(id created_at updated_at)

        CSV.foreach(path, headers: true) do |row|
          attr =
            if row.headers.include?("#{name.to_s.singularize}_id")
              { id: row["#{name.to_s.singularize}_id"] }
            else
              {}
            end
          attributes.each_with_object(attr) { |a, acc| acc[a] = row[a] }
          model.create(attr)
          progress.increment
        end
      end
    end
  end
end
