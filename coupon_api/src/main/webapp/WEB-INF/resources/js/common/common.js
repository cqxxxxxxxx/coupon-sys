/**
 * Created by chenqisheng on 16/4/28.
 *
 * 链接七牛
 *
 */
function genImageUrl(up, info) {
    var url;
    var res = $.parseJSON(info);
    var domain = up.getOption('domain');
    console.log(domain);
    url = "http://" + domain + "/" + encodeURI(res.key);
    var link = domain + res.key;
    return url;
}

function typeAhead(id, url, resultId) {
    var fi = true;
    $('#' + id).typeahead({
        source: function (query, process) {
            if (!fi) {
                return;
            }
            fi = false;
            $.getJSON(url + query, {}, function (response) {
                var data = [];
                var json = eval(response);
                for (var i in json) {
                    data.push(json[i].id + '_' + json[i].name);
                }
                process(data);
                fi = true;
            });
        },
        highlighter: function (item) {
            var parts = item.split('_');
            parts.shift();
            return parts.join('_');
        },
        updater: function (item) {
            var parts = item.split('_');
            $('#' + resultId).val(parts.shift());
            return parts.join('_');
        },
        minLength: 0
    });
}

function fillFormFromUrl(formId, url) {
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            if (data != null) {
                fillForm(formId, data, []);
            }
        }
    });
}
function fillForm(formId, data, imageIds) {
    var $inputs = $('#' + formId + ' input');
    $.each(data, function (key, value) {
        $inputs.filter(function () {
            return key == this.name;
        }).val(value);
    });
    var $select = $('#' + formId + ' select');
    $.each(data, function (key, value) {
        $select.filter(function () {
            return key == this.name;
        }).val(value);
    });

    var $textareas = $('#' + formId + ' textarea');
    $.each($textareas, function (key, value) {
        var name = $(this).attr('name');
        $(this).html(data[name]);
    })

    var $multi = $('#' + formId + ' select[multiple=multiple]');
    $.each($multi, function (key, value) {
        var name = $(this).attr("name");
        $(this).val(data[name].split(","));
    })

    for (key in imageIds) {
        var value = imageIds[key];
        if (data[value] != "") {
            $('#' + value).attr("src", data[value]);
        }
    }
}
function appendImagesToFormData(formData, imageIds) {
    var size = formData.length;
    for (key in imageIds) {
        formData[size] = {"name": imageIds[key], "value": $('#' + imageIds[key]).attr("src")};
        size++;
    }
}

function skipBlankImage(imageUrl) {
    if (imageUrl == "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNcvHh+PQAGPAJmNT5JDwAAAABJRU5ErkJggg==") {
        return null;
    } else {
        return imageUrl;
    }
}

function blankImgList(imageIds) {
    for (key in imageIds) {
        blankImg(imageIds[key]);
    }
}
function blankImg(imageId) {
    $('#' + imageId).attr("src", "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNcvHh+PQAGPAJmNT5JDwAAAABJRU5ErkJggg==");
}

function connectQiniuAndImage(uptoken_url, domain, take, show, imgPath) {
    //多七牛实例 可配置不同key前缀
    (new QiniuJsSDK()).uploader({
        runtimes: 'html5,flash,html4',
        browse_button: take,
//            container: 'container',
//            drop_element: 'container',
        max_file_size: '1mb',
        filters: {
            mime_types: [
                {title: "Image files", extensions: "jpg,jpeg,png"}
            ]
        },
        flash_swf_url: 'resources/qiniu/Moxie.swf',
        dragdrop: true,
        chunk_size: '4mb',
        uptoken_url: prefix + '/' + uptoken_url,
        domain: domain,
        auto_start: true,
        init: {
            'FilesAdded': function (up, files) {

            },
            'BeforeUpload': function (up, file) {
                NProgress.start()
            },
            'UploadProgress': function (up, file) {
                NProgress.set(file.percent)
            },
            'UploadComplete': function () {

            },
            'FileUploaded': function (up, file, info) {
                $('#' + show).attr("src", genImageUrl(up, info));
                NProgress.done()
            },
            'Error': function (up, err, errTip) {

            },
            'Key': function (up, file) {
                var key = new Date().getTime();
                console.log(imgPath);
                // do something with key
                return imgPath + '/' + key; // back的意思
            }
        }
    });
}

function initToastr() {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
}

/**************** amap *******************/
var map;
//在地图上绘制折线
var editor = {};

function initMap() {
    if (!$("#addressMap").hasClass("amap-container")) {
        map = new AMap.Map('addressMap', {
            resizeEnable: true,
            zoom: 15
        });

        // 矫正地图上不准确的点,即重新打点,并获取重新打点后的经纬度
        // 监听鼠标操作,获取点击后的经纬度
        AMap.event.addListener(map, 'click', function (e) {
            initMarker(e.lnglat.getLat(), e.lnglat.getLng());
            $('#lng').val(e.lnglat.getLng());
            $('#lat').val(e.lnglat.getLat());
        })
    }
    // 在地图上添加点标记
    map.clearMap();
}

$('#address').blur(function (e) {
    e.preventDefault();
    // 地理编码,返回地理编码结果,获取数据库中地址并解析为经纬度在地图上显示
    var searchAddress = $(this).val();
    AMap.plugin('AMap.Geocoder', function () {
        var geocoder = new AMap.Geocoder({
            radius: 1000
        });
        // 添加默认点
        var marker = new AMap.Marker({
            map: map,
            bubble: true
        })

        geocoder.getLocation(searchAddress, function (status, result) {
            if (status == 'complete' && result.geocodes.length) {
                // 在地图上添加点标记并设置该点为地图中心点
                marker.setPosition(result.geocodes[0].location);
                map.setCenter(marker.getPosition());

                $('#lng').val(result.geocodes[0].location.getLng());
                $('#lat').val(result.geocodes[0].location.getLat());
            } else {
                // 如果地址搜索不到,则警告
                alert("未能找到该地址!请核对地址后进行审核")
            }
        })
    })
})

function initMarker(lat, lng) {
    var marker = new AMap.Marker({
        position: new AMap.LngLat(lng, lat)
    });

    // 在地图上添加点标记
    map.clearMap();
    marker.setMap(map);
    map.setCenter(marker.getPosition());
}
