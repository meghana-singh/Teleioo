module ItemsHelper
  
  def time_remaining_for_item_comp (item_start_time)
    
    item_completion_time   = item_start_time + 7.days
    
    return distance_of_time_in_words(Time.now, item_completion_time)    
  end

end
