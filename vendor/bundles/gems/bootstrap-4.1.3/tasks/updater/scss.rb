class Updater
  module Scss
    def update_scss_assets
      log_status 'Updating scss...'
      save_to = @save_to[:scss]
      contents = {}
      bootstrap_scss_files = get_paths_by_type('scss', /\.scss$/)
      read_files('scss', bootstrap_scss_files).each do |name, file|
        contents[name] = file
        save_file("#{save_to}/#{name}", file)
      end
      log_processed "#{bootstrap_scss_files * ' '}"

      log_status 'Updating scss main files'
      %w(bootstrap bootstrap-grid bootstrap-reboot).each do |name|
        # Compass treats non-partials as targets to copy into the main project, so make them partials.
        # Also move them up a level to clearly indicate entry points.
        from = "#{save_to}/#{name}.scss"
        to   = "#{save_to}/../_#{name}.scss"
        FileUtils.mv from, to
        # As we moved the files, adjust imports accordingly.
        File.write to, File.read(to).gsub(/ "/, ' "bootstrap/')
      end
    end
  end
end
