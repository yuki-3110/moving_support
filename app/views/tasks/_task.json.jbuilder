json.extract! task, :id, :title, :content, :deadline, :position, :question_id, :created_at, :updated_at
json.url task_url(task, format: :json)
