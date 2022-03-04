<?php
namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;

class TestsImport implements ToCollection,WithCalculatedFormulas
{
    public function collection(Collection $rows)
    {
        session()->put('test-details', $rows);
    }
}