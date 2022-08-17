<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .uppercase {
            text-transform: uppercase;
        }

        .tracking-wide{
            letter-spacing: 0.025em;
        }

        .text-center{
            text-align: center;
        }

        table, td, th {
            border: 1px solid;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <h1 class="uppercase tracking-wide text-center">Laporan</h1>

    <table>
        <tr>
            <th>
                Nama Pemesan
            </th>
            <th>
                Daftar Pesanan
            </th>
            <th>
                Total Belanja
            </th>
        </tr>
        @php $total = 0 @endphp
        @foreach($orders as $order)
        <tr>
            <td>{{ $order['name'] }}</td>
            <td>
                <ul>
                    @foreach($order['data'] as $d)
                    <li>{{ $d['name'] }} ({{ $d['quantity'] }}) x {{$d['price']}}</li>
                    @endforeach
                </ul>
            </td>
            <td>
                @foreach($order['data'] as $d)
                    @php $total += $d['price'] * $d['quantity'] @endphp
                @endforeach
                <p>Rp{{ number_format($total) }}</p>
            </td>
        </tr>
        @endforeach
    </table>
</body>
</html>