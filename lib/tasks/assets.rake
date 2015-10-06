namespace :assets do
  desc "Create soft links as non digested assets"
  task soft_links: :environment do
    Rake::Task['assets:precompile'].invoke

    assets = Dir.glob(File.join(Rails.root, 'public/assets/**/{*,.*}'))
    manifest_path = assets.find { |f| f =~ /(manifest)(\-[a-z0-9]{32}\.)/ }
    manifest_data = JSON.load(File.new(manifest_path))
    manifest_data["assets"].each do |asset_name, file_name|
      file_path = File.join(Rails.root, 'public/assets', file_name)
      asset_path = File.join(Rails.root, 'public/assets', asset_name)
      FileUtils.ln_s(file_path, asset_path, :force => true)
    end

    puts "Successfully linked assets"
  end
end
