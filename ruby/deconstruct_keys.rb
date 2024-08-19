class Time
  def deconstruct_keys keys
    { :year    => year,
      :month   => month,
      :asctime => asctime,
      :ctime   => ctime,
      :yday    => yday,
      :zone    => zone }
  end
end
