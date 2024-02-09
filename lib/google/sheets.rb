require "google/apis/sheets_v4"

SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS

module Google
  class Sheets
    def initialize(sheet_id:)
      @service = initialize_service
      @sheet_id = sheet_id
    end

    def get_data(range:)
      parse_response(@service.get_spreadsheet_values(@sheet_id, range))
    end

    private

    def parse_response(response)
      rows = response.values
      rows[1..].map do |row|
        rows[0].zip(row).to_h
      end
    end

    def initialize_service
      Google::Apis::SheetsV4::SheetsService.new.tap do |service|
        service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
          json_key_io: File.open(ENV.fetch("GOOGLE_SERVICE_SECRET_PATH", nil)),
          scope: SCOPE
        )
      end
    end
  end
end
