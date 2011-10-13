namespace :assets do
  desc "Fix jquery-ui image assets for asset pipline/sprockets"
  task :fixjqueryui => :environment do
    path = Dir.getwd+"/app/assets/stylesheets/*jquery*ui*"
    file = Dir.glob(path).first
    fullsedstring = "sed 's/url(images\\/\\([^)]*\\))/url(\<\%\= asset_path \"\\1\" \%\>)/' #{file} > #{file}.erb"
    system(fullsedstring)
    system("mv #{file} /tmp") # just in case, the original file's moved the the /tmp directory, not deleted.
  end
end
