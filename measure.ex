defmodule Measure do

  def start do
    str = "aghfiahfoishgrfniorsahjnaiioahfuahilhfuazhiahuhfahfkahfahjkfafkjgsakghakujhfjkaghkfhlaskfjcnjrjkfvbsuirjhbfvjbnsjkfvnjfksdhgvjkfhsjkvhfjkshgvjfkshvjkbfshvfsdgvjkfshvshjlkvjksfdv.lfsdvkhkflsdvhlkfsdhvnkfsnvksdhfvkjlshdkjdhsghjsikrghioasjklfasjhjafgiohgiuhraiohgiotsjhiake.hgnsghiorsjfpr4iosegoirhniseojfaioreoswghotrjhbidgjoptdjhgibotdjrm;olgjiotdjgojsiohtgiosehgiuhisorjrtgfiorsyiuhbngisjfiorysifgjresiolkhasklfhklshfhd"
    word = "a"
    count(:regex, str, word)
    count(:string_split, str, word)
  end

  def count(:regex, str, word) do
    IO.inspect "Regex"
    IO.inspect "-------------"
    f = fn ->
      {_, r} = Regex.compile(word)
      Regex.scan(r, str) |> length
    end
    # 無名関数を格納した変数をtimer.tcに渡す
    {time, count} = :timer.tc(f)
    IO.inspect "count: #{count}"
    IO.inspect "time: #{time} μs"
    IO.inspect "-------------"
  end

  def count(:string_split, str, word) do
    IO.inspect "String.split"
    IO.inspect "-------------"
    f = fn ->
      count = String.split(str, word) |> length
      count - 1
    end
    # 無名関数を格納した変数をtimer.tcに渡す
    {time, count} = :timer.tc(f)
    IO.inspect "count: #{count}"
    IO.inspect "time: #{time} μs"
    IO.inspect "-------------"
  end
end

Measure.start
