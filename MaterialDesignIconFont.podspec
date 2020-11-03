#
# Be sure to run `pod lib lint GoogleMaterialIconFont.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "MaterialDesignIconFont"
    s.version          = "0.0.2"
    s.summary          = "Material Design Icons for ObjC or Swift project"
    s.homepage         = "https://github.com/FabianTerhorst/MaterialDesignIconFont"
    # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
    s.license          = 'MIT'
    s.author           = { "fabianterhorst" => "fabian.terhorst@gmail.com" }
    s.source           = { :git => "https://github.com/FabianTerhorst/MaterialDesignIconFont.git", :tag => s.version.to_s }

    s.platform     = :ios, '9.0'
    s.requires_arc = true

    s.source_files = 'Sources/**'
    s.resource_bundles = {
        'MaterialDesignIconFont' => ['Sources/Assets/*.ttf']
    }
end