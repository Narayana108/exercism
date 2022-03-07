defmodule LogLevel do
  def to_label(level, legacy?) do
    if legacy? do
      case level do
        1 -> :debug
        2 -> :info
        3 -> :warning
        4 -> :error
        _ -> :unknown
      end
    else
      case level do
        0 -> :trace
        1 -> :debug
        2 -> :info
        3 -> :warning
        4 -> :error
        5 -> :fatal
        _ -> :unknown
      end
    end
  end

  def alert_recipient(level, legacy?) do
    case {level, legacy?} do
      level when level == 4 or level == 5 -> :ops
      #level when level < 0 and legacy? == true -> :dev1
      _ -> false
    end
  end
end
