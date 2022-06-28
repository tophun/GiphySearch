# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def networking_pods
  # https://github.com/Alamofire/Alamofire
  pod 'Alamofire'
end

target 'GiphySearch' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GiphySearch
  networking_pods

  target 'GiphySearchTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GiphySearchUITests' do
    # Pods for testing
  end

end
