# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :foodcritic, :cookbook_paths => ".", :cli => "--epic-fail any" do
  watch(%r{metadata.rb$})
  watch(%r{attributes/.+\.rb$})
  watch(%r{providers/.+\.rb$})
  watch(%r{recipes/.+\.rb$})
  watch(%r{resources/.+\.rb$})
  watch(%r{templates/.+\.rb$})
end

guard :strainer, :standalone => true, :except => ['chefspec'], :color => true do
  watch %r{(.+)%}
end
