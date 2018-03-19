require 'csv'

namespace :gtfs do
  desc 'Import GTFS data in DB'
  task import: :environment do
    [StopTime, Stop, Trip, Route].each(&:delete_all)

    files = {
      routes: Rails.root.join('gtfs', 'data', 'routes.txt'),
      trips: Rails.root.join('gtfs', 'data', 'trips.txt'),
      stops: Rails.root.join('gtfs', 'data', 'stops.txt'),
      stop_times: Rails.root.join('gtfs', 'data', 'stop_times.txt')
    }

    if files.values.all? { |name| File.file?(name) }
      files.each do |name, path|
        line_count = `wc -l "#{path}"`.strip.split(' ')[0].to_i - 1
        progress = ProgressBar.create(title: name.to_s.humanize, total: line_count, format: '%t (%c/%C): |%w%i|')
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

  desc 'Export GTFS data in TypeScript file'
  task export: :environment do
    File.open(Rails.root.join('gtfs', 'ts', 'stops.ts'), 'w') do |file|
      file.puts('export const stops = [')

      progress = ProgressBar.create(title: 'Stops', total: Stop.count, format: '%t (%c/%C): |%w%i|')

      Stop.includes(:routes).find_each do |stop|
        file.puts('  {')
        file.puts("    id: '#{stop.id}',")
        file.puts("    name: \"#{stop.stop_name}\",")
        file.puts("    desc: \"#{stop.stop_desc}\",")
        file.puts("    lat: #{stop.stop_lat},")
        file.puts("    lon: #{stop.stop_lon},")
        file.puts('    routes: [')

        stop.routes.each do |route|
          file.puts('      {')
          file.puts("        id: '#{route.id}',")
          file.puts("        shortName: \"#{route.route_short_name}\",")
          file.puts("        longName: \"#{route.route_long_name}\",")
          file.puts("        desc: \"#{route.route_desc}\",")
          file.puts('      },')
        end

        file.puts('    ],')
        file.puts('  },')
        progress.increment
      end

      file.puts('];')
    end
  end
end
