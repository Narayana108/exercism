defmodule FreelancerRates do
  @work_hours 8.0
  @work_days 22

  def daily_rate(hourly_rate), do: hourly_rate * @work_hours

  def apply_discount(before_discount, discount) do
    (before_discount - before_discount * (discount / 100)) |> Float.round(5)
  end

  def monthly_rate(hourly_rate, discount) do
    (hourly_rate * @work_days)
    |> daily_rate
    |> apply_discount(discount)
    |> Float.ceil()
    |> trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    day_rate_with_discount =
      daily_rate(hourly_rate)
      |> apply_discount(discount)

    (budget / day_rate_with_discount)
    |> Float.floor(1)
  end
end
