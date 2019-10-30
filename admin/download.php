<?php
session_start();
require_once("../global/libs/gfconfig.php");
$id         = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$filename   = isset($_GET['filename']) ? addslashes($_GET['filename']) : '';

if($id != 0 && $filename != ''){
    $dl_file = preg_replace("([^\w\s\d\-_~,;:\[\]\(\].]|[\.]{2,})", '', $filename); // simple file name validation
    $dl_file = filter_var($dl_file, FILTER_SANITIZE_URL); // Remove (more) invalid characters
    $fullPath = ROOTHOST.'uploads/'.$dl_file;

    if ($fd = fopen ($fullPath, "r")) {
        $fsize = filesize('../uploads/'.$dl_file);
        $path_parts = pathinfo($fullPath);

        $known_mime_types = array(
            "txt" => "text/plain",
            "pdf" => "application/pdf",
            "csv" => "text/csv",
            "doc" => "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "docx" => "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "xls" => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "xlsx" => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "xml" => "text/xml",
            "htm" => "text/html"
        );

        $ext = strtolower($path_parts["extension"]);
        switch ($ext) {
            case "txt":
            header("Content-type: ". $known_mime_types['txt']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            case "pdf":
            header("Content-type: ". $known_mime_types['pdf']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            case "csv":
            header("Content-type: ". $known_mime_types['csv']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            case "doc":
            header("Content-type: ". $known_mime_types['doc']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            case "docx":
            header("Content-type: ". $known_mime_types['docx']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            case "xls":
            header("Content-type: ". $known_mime_types['xls']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            case "xlsx":
            header("Content-type: ". $known_mime_types['xlsx']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            case "xml":
            header("Content-type: ". $known_mime_types['xml']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            case "html":
            header("Content-type: ". $known_mime_types['html']);
            header("Content-Disposition: attachment; filename=\"".$path_parts["basename"]."\""); // use 'attachment' to force a file download
            break;
            // add more headers for other content types here
            default;
            header("Content-type: application/octet-stream");
            header("Content-Disposition: filename=\"".$path_parts["basename"]."\"");
            break;
        }
        header("Content-length: $fsize");
        header("Cache-control: private"); //use this to open files directly
        while(!feof($fd)) {
            $buffer = fread($fd, 2048);
            echo $buffer;
        }
    }
    fclose ($fd);
    exit;
}
?>