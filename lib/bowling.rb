class Bowling
  def initialize
    @roll = 0
    @rolls = Array.new
  end

  def hit pins
    @rolls[@roll] = pins
    @roll += 1
  end

  def score
    score = 0
    frame_index = 0

    for frame in 0..9 do
      if strike? frame_index
        score += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif spare? frame_index
        score += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        score += sum_pins frame_index
        frame_index += 2
      end
    end

    score
  end

  private

  def sum_pins frame_index
    return @rolls[frame_index] + @rolls[frame_index + 1]
  end

  def spare? frame_index
    return @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end

  def spare_bonus frame_index
    @rolls[frame_index + 2]
  end

  def strike? frame_index
    return @rolls[frame_index] == 10
  end

  def strike_bonus frame_index
    return @rolls[frame_index + 1] + @rolls[frame_index + 2]
  end
end
