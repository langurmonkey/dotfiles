function up
  set target ""
  for count in (seq $argv)
    set target "$target../"
  end
  cd $target
end
