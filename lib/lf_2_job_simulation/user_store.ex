defmodule Lf2JobSimulation.UserStore do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    :ets.new(:users, [:named_table, :public, :set])
    :ets.new(:options, [:named_table, :public, :set])

    :ets.insert(
      :options,
      {:options_test_1,
       [
         "DDR5",
         "temporär",
         "CPU",
         "Double Data Rate",
         "Kurzspeicher",
         "verloren"
       ]}
    )

    {:ok, nil}
  end

  def create_user(session_id) do
    :ets.insert(:users, {
      session_id,
      false,
      false
    })
  end

  def get_user(session_id, default \\ %{}) do
    case :ets.lookup(:users, session_id) do
      [{^session_id, test1, test2, test1_result}] ->
        %{test1: test1, test2: test2, test1_result: test1_result}

      [{^session_id, test1, test2}] ->
        %{test1: test1, test2: test2}

      [] ->
        default
    end
  end

  def update_user(session_id, test1, test2) do
    :ets.insert(:users, {session_id, test1, test2})
  end

  def reset_user(session_id) do
    :ets.delete(:users, session_id)
    :ets.insert(:users, {session_id, false, false})
  end

  def update_user_results_test_one(session_id, test1, test2, results) do
    :ets.delete(:users, session_id)
    :ets.insert(:users, {session_id, test1, test2, results})
  end

  def get_options(key) do
    result = :ets.lookup(:options, key)
    options_test_1 = Keyword.get(result, key)
  end

  def delete_user(session_id) do
    :ets.delete(:users, session_id)
  end

  def count_users do
    :ets.info(:users, :size)
  end

  def delete_all_users do
    :ets.delete_all_objects(:users)
  end
end
