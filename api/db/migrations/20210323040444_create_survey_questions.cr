class CreateSurveyQuestions::V20210323040444 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(SurveyQuestion) do
      primary_key id : UUID
      add_timestamps

      add_belongs_to survey : Survey, on_delete: :cascade, foreign_key_type: UUID
      add_belongs_to question : Question, on_delete: :cascade, foreign_key_type: UUID
    end
  end

  def rollback
    drop table_for(SurveyQuestion)
  end
end
