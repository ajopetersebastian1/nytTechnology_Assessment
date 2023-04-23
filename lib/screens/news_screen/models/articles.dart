// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
    Articles({
        this.status,
        this.copyright,
        this.numResults,
        this.results,
    });

    final String? status;
    final String? copyright;
    final int? numResults;
    final List<Result>? results;

    factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.uri,
        this.url,
        this.id,
        this.assetId,
        this.source,
        this.publishedDate,
        this.updated,
        this.section,
        this.subsection,
        this.nytdsection,
        this.adxKeywords,
        this.column,
        this.byline,
        this.type,
        this.title,
        this.resultAbstract,
        this.desFacet,
        this.orgFacet,
        this.perFacet,
        this.geoFacet,
        this.media,
        this.etaId,
    });

    final String? uri;
    final String? url;
    final int? id;
    final int? assetId;
    final Source? source;
    final DateTime? publishedDate;
    final DateTime? updated;
    final String? section;
    final String? subsection;
    final String? nytdsection;
    final String? adxKeywords;
    final dynamic column;
    final String? byline;
    final ResultType? type;
    final String? title;
    final String? resultAbstract;
    final List<String>? desFacet;
    final List<String>? orgFacet;
    final List<String>? perFacet;
    final List<String>? geoFacet;
    final List<Media>? media;
    final int? etaId;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        uri: json["uri"],
        url: json["url"],
        id: json["id"],
        assetId: json["asset_id"],
        source: sourceValues.map[json["source"]],
        publishedDate: DateTime.parse(json["published_date"]),
        updated: DateTime.parse(json["updated"]),
        section: json["section"],
        subsection: json["subsection"],
        nytdsection: json["nytdsection"],
        adxKeywords: json["adx_keywords"],
        column: json["column"],
        byline: json["byline"],
        type: resultTypeValues.map[json["type"]],
        title: json["title"],
        resultAbstract: json["abstract"],
        desFacet: List<String>.from(json["des_facet"].map((x) => x)),
        orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
        perFacet: List<String>.from(json["per_facet"].map((x) => x)),
        geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        etaId: json["eta_id"],
    );

    Map<String, dynamic> toJson() => {
        "uri": uri,
        "url": url,
        "id": id,
        "asset_id": assetId,
        "source": sourceValues.reverse[source],
        "published_date": "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "updated": updated!.toIso8601String(),
        "section": section,
        "subsection": subsection,
        "nytdsection": nytdsection,
        "adx_keywords": adxKeywords,
        "column": column,
        "byline": byline,
        "type": resultTypeValues.reverse[type],
        "title": title,
        "abstract": resultAbstract,
        "des_facet": List<dynamic>.from(desFacet!.map((x) => x)),
        "org_facet": List<dynamic>.from(orgFacet!.map((x) => x)),
        "per_facet": List<dynamic>.from(perFacet!.map((x) => x)),
        "geo_facet": List<dynamic>.from(geoFacet!.map((x) => x)),
        "media": List<dynamic>.from(media!.map((x) => x.toJson())),
        "eta_id": etaId,
    };
}

class Media {
    Media({
        this.type,
        this.subtype,
        this.caption,
        this.copyright,
        this.approvedForSyndication,
        this.mediaMetadata,
    });

    final MediaType? type;
    final Subtype? subtype;
    final String? caption;
    final String? copyright;
    final int? approvedForSyndication;
    final List<MediaMetadatum>? mediaMetadata;

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: mediaTypeValues.map[json["type"]],
        subtype: subtypeValues.map[json["subtype"]],
        caption: json["caption"],
        copyright: json["copyright"],
        approvedForSyndication: json["approved_for_syndication"],
        mediaMetadata: List<MediaMetadatum>.from(json["media-metadata"].map((x) => MediaMetadatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": mediaTypeValues.reverse[type],
        "subtype": subtypeValues.reverse[subtype],
        "caption": caption,
        "copyright": copyright,
        "approved_for_syndication": approvedForSyndication,
        "media-metadata": List<dynamic>.from(mediaMetadata!.map((x) => x.toJson())),
    };
}

class MediaMetadatum {
    MediaMetadatum({
        this.url,
        this.format,
        this.height,
        this.width,
    });

    final String? url;
    final Format? format;
    final int? height;
    final int? width;

    factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
        url: json["url"],
        format: formatValues.map[json["format"]],
        height: json["height"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "format": formatValues.reverse[format],
        "height": height,
        "width": width,
    };
}

enum Format { STANDARD_THUMBNAIL, MEDIUM_THREE_BY_TWO210, MEDIUM_THREE_BY_TWO440 }

final formatValues = EnumValues({
    "mediumThreeByTwo210": Format.MEDIUM_THREE_BY_TWO210,
    "mediumThreeByTwo440": Format.MEDIUM_THREE_BY_TWO440,
    "Standard Thumbnail": Format.STANDARD_THUMBNAIL
});

enum Subtype { PHOTO }

final subtypeValues = EnumValues({
    "photo": Subtype.PHOTO
});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({
    "image": MediaType.IMAGE
});

enum Source { NEW_YORK_TIMES }

final sourceValues = EnumValues({
    "New York Times": Source.NEW_YORK_TIMES
});

enum ResultType { ARTICLE }

final resultTypeValues = EnumValues({
    "Article": ResultType.ARTICLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
