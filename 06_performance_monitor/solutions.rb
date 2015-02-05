#Solution 1
def measure count=1
  total_time = 0
  count.times do
    start_time = Time.now

    yield

    end_time = Time.now
    total_time += end_time - start_time
  end
  total_time / count
end

#Solution 2
def measure n = 1
    time = Time.now
    for n in 1..n do yield if block_given?
    end
    time -= Time.now
    time = (time ** 2) ** 0.5 / n
end
