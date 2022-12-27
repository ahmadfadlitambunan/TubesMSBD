<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="id" lang="id">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Export Invoice</title>
    <meta name="author" content="Tri Fine Laurensi Br.Ginting" />
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            text-indent: 0;
        }

        p {
            color: black;
            font-family: "Times New Roman", serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: none;
            font-size: 12pt;
            margin: 0pt;
        }

        .s1 {
            color: black;
            font-family: "Times New Roman", serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: none;
            font-size: 12pt;
        }

        table,
        tbody {
            vertical-align: top;
            overflow: visible;
        }

        .texttable{
            vertical-align: middle;
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .tableup{
            margin-top: 20px;
            margin-bottom: 30px;
            display: flex;
        }
        .tdtabletext{
            vertical-align: middle;
            justify-content: center;
            
        }

        .divboxin{
            width: 950px;
        }

        .header{
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 40px;

        }

        .tableup{
            margin-bottom: 40px;
        }

        .final{
            width: 850px;
            display: flex;
            justify-content: flex-start;

        }

        .hrstl{
            width: 1000px;
        }

    </style>
</head>

<body>
    <center>
<div class="final">
    <table class="tableup">
        <tr>
            <td><img class="gymimg" width="220" height="140"; src="data:image/jpg;base64,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" />
            </td>
        </table>
    <div class="header">
        <center>
    <table>
    <td class="tdtabletext" style="text-align: center">
    <p style="text-indent: 0pt;text-align: center;">
        <span style="color: black; font-family: Times New Roman, serif; font-style: normal; font-weight: normal; text-decoration: none; font-size: 24pt">
            OLYMPUS GYM
        </span>
    </p>

    <p style="padding-top: 8pt;text-indent: 0pt;text-align: center;"><span style=" color: black; font-family:Times New Roman, serif; font-style: normal; font-weight: normal; text-decoration: none; font-size: 14pt;">
            Dr. Mansyur gg.berdikari No.2 medan
        </span>
    </p>
        
    <p style="padding-top: 2pt;text-indent: 0pt;text-align: center;">
        <a href="https://www.instagram.com/olympusgym.id/"><span style=" color: #0462C1; font-family:Times New Roman, serif; font-style: normal; font-weight: normal; text-decoration: underline; font-size: 12pt;">
            https://www.instagram.com/olympusgym.id/
        </span>
    </a>
    </p>

</td>
</tr>
</div>

    </table>
</div>
</div>
<center>
        <div class="hrstl">
        <hr style="padding-bottom: 5px;">
        <hr>
    </div>
</center>


    <center>
    <div class="divboxin">
    <p style="padding-top: 14pt;text-indent: 0pt;text-align: center;"><strong>LAPORAN DATA PEMBAYARAN</strong></p>
    <p style="padding-top: 14pt; padding-bottom: 10px; text-indent: 0pt;text-align: left;">Di cetak pada :</p>
    <table style="border-collapse:collapse" cellspacing="0">

        <tr style="height:14pt">
            <td
                style="width:25pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    No</p>
            </td>
            <td
                style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    ID</p>
            </td>
            <td
                style="width:110pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 38pt;padding-right: 38pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    Nama</p>
            </td>
            <td
                style="width:60pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1" style="padding-left: 6pt;text-indent: 0pt;line-height: 13pt;text-align: left;">Metode Pembayaran</p>
            </td>
            <td
                style="width:70pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    Plans</p>
            </td>
            <td
                style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 38pt;padding-right: 38pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    Verified_By</p>
            </td>
            <td
                style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 38pt;padding-right: 38pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    Verified_At</p>
            </td>
            <td
                style="width:75pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    Jumlah Pembayaran</p>
            </td>
            <td
                style="width:68pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    Status</p>
            </td>
        </tr>

        <?php $i = 0;?>
        @foreach ($member as $item)
            
        <tr style="height:14pt">
            <td
                style="width:25pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    {{$loop->iteration}}</p>
            </td>
            <td
                style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    {{$item->user_id}}</p>
            </td>
            <td
                style="width:110pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1" style="padding-left: 5pt;text-indent: 0pt;line-height: 13pt;text-align: left;">{{$item->user_name}}
                </p>
            </td>
            <td
                style="width:60pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1" style="padding-left: 5pt;text-indent: 0pt;line-height: 13pt;text-align: left;">{{$item->mp_name}}
                </p>
            </td>
            <td
                style="width:70pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1" style="padding-left: 5pt;text-indent: 0pt;line-height: 13pt;text-align: left;">{{$item->plan_name}}
                </p>
            </td>
            <td
                style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 5pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    {{$verified_by[$i]->name}}</p>
                <?php $i++; ?>
            </td>
            <td
                style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1" style="padding-left: 5pt;text-indent: 0pt;line-height: 13pt;text-align: left;">Senin, 27 Desember 2022
                </p>
            </td>
            <td
                style="width:75pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    {{$item->pending_amount}}</p>
            </td>
            <td
                style="width:68pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                <p class="s1"
                    style="padding-left: 4pt;padding-right: 4pt;text-indent: 0pt;line-height: 13pt;text-align: center;">
                    {{$item->status}}</p>
            </td>
        </tr>

        @endforeach
    </table>

</div>

</body>
<script>
    window.print();
</script>
</html>