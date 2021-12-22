def build_caves(file_name)
  mapping = File.readlines(file_name).collect(&:strip).map { |line| line.split('-') }
  all_caves = mapping.flatten.uniq.to_h { |s| [s, Set[]] }
  mapping.each.with_object(all_caves) do |m, caves|
    caves[m[0]].add(m[1])
    caves[m[1]].add(m[0])
  end

  possible_paths = []
  find_paths(all_caves, 'start', [], possible_paths)
  possible_paths.length
end

def find_paths(all_caves, current_cave, current_path, possible_paths)
  current_path.push(current_cave)
  if current_cave == 'end'
    possible_paths.push(current_path)
  else
    paths = all_caves[current_cave]
    paths.each do |exit|
      next if exit == 'start'
      #next if exit != exit.upcase && current_path.include?(exit)
      hashed_paths = current_path.select { |exit| exit != exit.upcase && exit != 'start' && exit != 'end' }.tally
      next if hashed_paths.key?(exit) && (hashed_paths.values.include? 2 || hashed_paths[exit] == 1)

      next_path = current_path.clone
      find_paths(all_caves, exit, next_path, possible_paths)
    end
  end
end
