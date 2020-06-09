class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_txt} #{is_completed}"
  end

  def due_today?
    due_date == Date.today
  end

  def self.completed
    all.where(completed: true)
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_txt} #{display_date}"
  end

  def self.overdue
    all.where("due_date < ? and (not completed) ", Date.today).order(:due_date)
  end

  def self.due_today
    all.where("due_date = ?", Date.today).order(:due_date)
  end

  def self.due_later
    all.where("due_date  > ?", Date.today).order(:due_date)
  end
end
