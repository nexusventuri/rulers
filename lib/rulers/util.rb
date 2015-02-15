module Rulers
	def self.to_underscore(string)
		string.gsub(/::/, "/").
			gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
			gsub(/([a-z\d])([A-Z])/, '\1_\2').
			tr("-", "_").
			downcase
	end

	def self.file_in_load_path?(path_to_file)
		$LOAD_PATH.find do |path|
			File.file?(File.join(path, path_to_file))
		end
	end
end
