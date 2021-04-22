class BarcodeService

  def initialize(params)
    @params = params
  end

  def call
    scan_numbers = @params.split(',')
    match_scan_numbers = scan_numbers.first.map {|num| num.match(/\d+/) }
    string_scan_numbers = match_scan_numbers.map { |n| n.to_s}
    array_isbn = string_scan_numbers.map { |n| n.match(/^(?:ISBN(?:-13)?:?\ )?(?=[0-9]{13}$|(?=(?:[0-9]+[-\ ]){4})[-\ 0-9]{17}$)97[89][-\ ]?[0-9]{1,5}[-\ ]?[0-9]+[-\ ]?[0-9]+[-\ ]?[0-9]$/) }
    good_isbn = array_isbn.select { |n| n != nil }
    good_isbn.first.to_s
  end

end
