class Float
  def floor_to(x)
    sprintf('%.2f', (self * 10**x).floor.to_f / 10**x)
  end
end
