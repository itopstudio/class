/**
 * WebUploader 初始化配置文件
 * @type {[type]}
 */
var $list = $('#thelist');
var key;    //文件校对码
var uploader = WebUploader.create({

    // swf文件路径
    swf: 'js/webuploader/Uploader.swf',

    // 文件接收服务端。
    server: './upload.php',

    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: '#picker',

    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
    resize: false,

    accept: {
        title: 'Files',
        extensions: 'doc,docx,pdf,zip,rar'
    },
    // fileNumLimit: 1,
    //单个文件限制大小 不超过20M
    fileSingleSizeLimit: 5242880*4, 
});

// 当有文件被添加进队列的时候
uploader.on( 'fileQueued', function( file ) {
    $list.append( '<div id="upload-file" class="item">' +
        '<h4 class="info">' + file.name + '</h4>' +
        '<p class="state">等待上传...</p>' +
    '</div>' );
    $('#delBtn').attr("data-file-id",file.id);
});
//开始上传
$('#ctlBtn').click(function(){
    console.log("start");
    if(uploader.isInProgress() == false){
        uploader.upload();
        $('#ctlBtn').text("停止上传");
    }else{
        uploader.stop(true);
        $('#ctlBtn').text("开始上传");
    }
});
//删除文件
$('#delBtn').click(function(){
    var fileId = $('#delBtn').attr("data-file-id");
    if(uploader.isInProgress() == true){
        uploader.stop(true);
    }
    //删除上传文件
    uploader.removeFile( fileId );
    $('#upload-file').remove();
});
// 文件上传过程中创建进度条实时显示。
uploader.on( 'uploadProgress', function( file, percentage ) {
    console.log("uploading");
    var $li = $( '#upload-file' ),
        $percent = $li.find('.progress .progress-bar');

    // 避免重复创建
    if ( !$percent.length ) {
        $percent = $('<div style="width: 80%" class="progress progress-striped active">' +
          '<div class="progress-bar" role="progressbar" style="width: 0%">' +
          '</div>' +
        '</div>').appendTo( $li ).find('.progress-bar');
    }

    $li.find('p.state').text('上传中: '+ parseInt(percentage * 100) + '%');

    $percent.css( 'width', percentage * 100 + '%' );
});

uploader.on( 'uploadSuccess', function( file ) {
    $( '#upload-file' ).find('p.state').text('已上传');
});

uploader.on( 'uploadError', function( file ) {
    $( '#upload-file' ).find('p.state').text('上传出错');
});

uploader.on( 'uploadComplete', function( file ) {
    $( '#upload-file' ).find('.progress').fadeOut();
});
//接收服务端返回的信息
uploader.on( 'uploadAccept', function( file, response ) {
    if ( response.state == 1 ) {
        // 通过return false来告诉组件，此文件上传有错。
        key = response.url;
        console.log(key);
        return true;
    }else{
        $( '#upload-file' ).find('p.state').text('上传出错');
        return false;
    }
});